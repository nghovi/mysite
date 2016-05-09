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


def delete_notes(request):
    # utils.dump(request.POST)
    # utils.dump(request.POST)
    note_ids = request.POST.get('ids')
    note_ids = note_ids.split(NOTE_ID_DELIMITER)
    for note_id in note_ids:
        deleted_note = Note.objects.get(pk=note_id)
        deleted_note.delete()

    return JSONResponseOk(data=note_ids, status=status.HTTP_200_OK)
