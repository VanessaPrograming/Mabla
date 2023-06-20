from django.urls import path
from Tablas.models import *
from .views import *
from . import views

urlpatterns = [
    path('tablaUsuario',getTablaUser.as_view(), name='tablaUsuario'),
    path('insertUser',insertTablaUser.as_view(), name='insertUser'),
    path('insertUserForm/',views.formInsert, name='insertUserForm'),
    path('editUser/<pk>',editTablaUser.as_view(),name='editUser'),
    path('insertComment',insertComment.as_view(),name='insertComment'),
    path('editComment/<pk>',editComment.as_view(),name='editComment/<pk>'),
    path('deleteComment/<pk>',deleteComment.as_view(),name='deleteComment/<pk>'),
    path('tablaPrueba',getTablaPrueba.as_view(),name='tablaPrueba'),
    path('insertPrueba',insertPrueba.as_view(),name='insertPrueba'),

    path('getPreguntas/',getPreguntas.as_view(),name='getpreg'),
    path('postPreguntas/',PostPreguntas.as_view(),name='postpreg'),
    path('putPregunta/<pk>',editPregunta.as_view(), name="editPreg"),
    path('deletePregunta/<pk>',deletePregunta.as_view(), name="deletePreg"),

    path('inicio',views.iniciohtml, name="inicio"),

    path('getcate',getcategoria.as_view(),name='getcate'),
    path('postcate',postcategoria.as_view(),name='postcate'),
    path('deletecate/<pk>',deletecategoria.as_view(),name='deletecate'),

    path('getsubcate',getsubcategoria.as_view(),name='getsubcate'),
    path('postsubcate',postsubcategoria.as_view(),name='postsubcate'),
    path('deletesubcate/<pk>',deletesubcategoria.as_view(),name='deletesubcate'),


]
