import logging

from .models import Note
from .models import NoteSerializer
from utils import JSONResponseOk

from rest_framework import generics
from rest_framework import permissions
from rest_framework import status


NOTE_ID_DELIMITER = ','


logger = logging.getLogger('mine')


class NoteList(generics.ListCreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Note.objects.all()
    serializer_class = NoteSerializer


class NoteDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Note.objects.all().order_by('modified')
    serializer_class = NoteSerializer

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return JSONResponseOk(data=instance.id, status=status.HTTP_200_OK)


# def get_note(request, note_id):
#     utils.dump(request.GET)
#     note = Note.objects.get(pk=note_id)
#     serializer = NoteSerializer(instance=note)
#     return JSONResponseOk(serializer.data)


# @basicauth
# def get_notes(request):
#     notes = Note.objects.all().order_by('modified')
#     serializer = NoteSerializer(instance=notes, many=True)
#     return JSONResponseOk(serializer.data)


# def add_note(request):
#     content = request.POST.get('content')
#     notetype = request.POST.get('notetype')

#     new_note = Note(content=content, notetype=notetype)
#     new_note.save()

#     serializer = NoteSerializer(instance=new_note)
#     return JSONResponseOk(serializer.data)

# def edit_note(request, pk):
#     utils.dump(request.body)
#     note_id = request.POST.get('id')
#     content = request.POST.get('content')
#     notetype = request.POST.get('notetype')

#     old_note = Note.objects.get(pk=note_id)
#     old_note.content = content
#     old_note.notetype = notetype
#     old_note.save()

#     serializer = NoteSerializer(instance=old_note)
#     return JSONResponseOk(serializer.data)

# def delete_notes(request):
# utils.dump(request.POST)
#     note_ids = request.POST.get('ids')
#     note_ids = note_ids.split(NOTE_ID_DELIMITER)
#     for note_id in note_ids:
#         deleted_note = Note.objects.get(pk=note_id)
#         deleted_note.delete()

#     return JSONResponseOk(note_ids)
