from django.contrib import admin

# Register your models here.
from .models import Task
from .models import Book
from .models import UserPreference
from .models import Link
from .models import Motto
from .models import Phrase
from .models import Word


admin.site.register(Task)
admin.site.register(Book)
admin.site.register(UserPreference)
admin.site.register(Link)
admin.site.register(Motto)
admin.site.register(Word)
admin.site.register(Phrase)
