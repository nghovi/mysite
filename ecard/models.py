from django.db import models
from rest_framework import serializers
import utils

# Create your models here.


class Link(models.Model):
    url = models.CharField(max_length=200, blank=True, default='')
    description = models.CharField(max_length=300)
    status = models.IntegerField(default=0)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)


class LinkSerializer(serializers.ModelSerializer):
    # id =  serializers.IntegerField()# Must have to do this or else id will
    # be read only and cannot appear on validated_data
    class Meta:
        model = Link
        fields = ('id', 'url', 'description', 'status')


class Book(models.Model):
    iconurl = models.CharField(max_length=200, default="", blank=True)
    author = models.CharField(max_length=200, blank=True, default='Unknown')
    name = models.CharField(max_length=200)
    # default = '' doesn't mean field can be blank or '' in form
    comment = models.CharField(max_length=500, blank=True, default='')
    # only set null=True for non-string fields
    link = models.ForeignKey(Link, default=None, blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

    def has_word(self, word_id):
        for word in self.words.all():  # words is RelatedManager object
            if word.id == word_id:
                return True
        return False

    def get_word(self, word_id):
        for word in self.words.all():
            print word.id
            if word.id == word_id:
                return word
        return None


class Word(models.Model):
    book = models.ForeignKey(
        Book, related_name='words', default=None, blank=True, null=True)
    syllabus = models.CharField(max_length=200)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

    def has_phrase(self, phrase_id):
        for phrase in self.phrases.all():  # phrases is RelatedManager object
            if phrase.id == phrase_id:
                return True
        return False

    def get_phrase(self, phrase_id):
        for phrase in self.phrases.all():
            if phrase.id == phrase_id:
                return phrase
        return None


class Phrase(models.Model):
    word = models.ForeignKey(
        Word, related_name="phrases", default=None, blank=True, null=True)
    content = models.CharField(max_length=2000)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)


class PhraseSerializer(serializers.ModelSerializer):
    # Must have to do this or else id will be read only and cannot appear on
    # validated_data
    id = serializers.IntegerField()

    class Meta:
        model = Phrase
        fields = ('content', 'id')
        # why fields is autoconverted to string if we don't leave, at the end


class WordSerializer(serializers.ModelSerializer):
    # Must have to do this or else id will be read only and cannot appear on
    # validated_data
    id = serializers.IntegerField()
    phrases = PhraseSerializer(many=True, read_only=False)

    class Meta:
        model = Word
        fields = ('id', 'syllabus', 'phrases')

    def update(self, instance, validated_data):
        instance.syllabus = validated_data.get('syllabus')
        phrase_data = validated_data.get('phrases')
        ids = getIds(instance.phrases.all())
        for phrase in phrase_data:
            if phrase.get('id') in ids:
                PhraseSerializer().update(
                    instance=instance.get_phrase(phrase.get('id')), validated_data=phrase)
            else:
                Phrase.objects.create(
                    word=instance, content=phrase.get('content'))

        instance.save()
        return instance


class BookSimpleSerializer(serializers.ModelSerializer):
    # If readonly=True, link wil not appear in validated_data of create,
    # though it'll in form
    link = LinkSerializer(many=False, read_only=False)

    class Meta:
        model = Book
        fields = ('id', 'iconurl', 'author', 'name', 'comment', 'link')

    def create(self, validated_data):
        """
        Create and return a new `Book` instance, given the validated data.
        """
        utils.dump(validated_data)
        link = Link(url=validated_data.get('link').get(
            'url'), description="Link of Book " + validated_data.get('name'))
        link.save()
        new_book = Book(link=link, name=validated_data.get('name'), author=validated_data.get(
            'author'), comment=validated_data.get('comment'), iconurl=validated_data.get('iconurl'))
        new_book.save()

        return new_book


class BookSerializer(serializers.ModelSerializer):
    # id =  serializers.IntegerField()# Must have to do this or else id will
    # be read only and cannot appear on validated_data
    link = LinkSerializer(many=False, read_only=False)
    words = WordSerializer(many=True, read_only=True)

    class Meta:
        model = Book
        fields = (
            'id', 'iconurl', 'author', 'name', 'comment', 'link', 'words')

    def update(self, instance, validated_data):
        """
        with nested serializer i will update data for each child,
        not updated whole in their parent
        in this case, because link is simple so that i updated it here
        """
        instance.name = validated_data.get('name')
        instance.iconurl = validated_data.get('iconurl')
        instance.author = validated_data.get('author')
        instance.comment = validated_data.get('comment')
        link_data = validated_data.get('link')
        utils.dump(validated_data)
        if instance.link is None:
            link = Link(url=validated_data.get('link').get(
                'url'), description="Link of Book " + validated_data.get('name'))
            link.save()
            instance.link = link
        else:
            LinkSerializer().update(
                instance=instance.link, validated_data=link_data)
        # ids = getIds(instance.words.all())
        # for word in words_data:
        #     if word.get('id') in ids:
        #         WordSerializer().update(instance=instance.get_word(word['id']), validated_data=word)
        #     else:
        #         Word.objects.create(book=instance, syllabus=word.get('syllabus'))
        instance.save()
        return instance


def getIds(models):
    ids = []
    for model in models:
        ids.append(model.id)
    return ids


class Task(models.Model):
    UNFINISHED = 0
    FINISHED = 1
    HIGH_PRIORITY = 1
    MEDIUM_PRIORITY = 2
    LOW_PRIORITY = 3

    name = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    priority = models.IntegerField(default=HIGH_PRIORITY)
    status = models.IntegerField(default=UNFINISHED)
    date = models.DateTimeField()
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)


class TaskSerializer(serializers.ModelSerializer):
    # id =  serializers.IntegerField()# Must have to do this or else id will
    # be read only and cannot appear on validated_data
    class Meta:
        model = Task
        fields = ('id', 'name', 'description', 'status', 'priority', 'date')


class Motto(models.Model):
    message = models.CharField(max_length=200)
    mottotype = models.IntegerField(default=0)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)


class Note(models.Model):
    REMEMBER = 0
    IDEA = 1
    content = models.CharField(max_length=2000)
    notetype = models.IntegerField(default=REMEMBER)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)


class NoteSerializer(serializers.ModelSerializer):
    # id =  serializers.IntegerField()# Must have to do this or else id will
    # be read only and cannot appear on validated_data
    class Meta:
        model = Note
        fields = ('id', 'content', 'modified', 'notetype')


class UserPreference(models.Model):
    primary_card = models.ForeignKey(Link)
    user_id = models.IntegerField('user id')
