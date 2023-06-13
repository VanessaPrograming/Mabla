# Generated by Django 4.1.7 on 2023-06-06 15:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Tablas', '0002_remove_tablacomentarios_alias_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='TablaCategoria',
            fields=[
                ('IdCategoria', models.AutoField(primary_key=True, serialize=False, verbose_name='IdCategoria')),
                ('Categoria', models.TextField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='TablaPreguntas',
            fields=[
                ('tipo', models.PositiveIntegerField(verbose_name='Tipo')),
                ('senia', models.TextField()),
                ('respuesta', models.TextField(max_length=50)),
                ('numeroPregunta', models.AutoField(primary_key=True, serialize=False)),
                ('idCategoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablacategoria')),
            ],
        ),
        migrations.CreateModel(
            name='TablaUsuario',
            fields=[
                ('alias', models.TextField(max_length=30, primary_key=True, serialize=False)),
                ('nombre', models.TextField(max_length=30)),
                ('apellido', models.TextField(max_length=30)),
                ('telefono', models.PositiveBigIntegerField(verbose_name='Teléfono')),
                ('correo', models.TextField(max_length=30)),
                ('clave', models.TextField(max_length=30)),
                ('imgPerfil', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='TablaSubcategoria',
            fields=[
                ('IdSubcategoria', models.AutoField(primary_key=True, serialize=False, verbose_name='IdSubcategoria')),
                ('Subcategoria', models.TextField(max_length=30)),
                ('IdCategoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablacategoria')),
            ],
        ),
        migrations.CreateModel(
            name='TablaPruebas',
            fields=[
                ('idPrueba', models.AutoField(primary_key=True, serialize=False)),
                ('tipoPrueba', models.PositiveSmallIntegerField(verbose_name='Tipo de prueba')),
                ('categoria', models.TextField(max_length=30)),
                ('fecha', models.DateTimeField()),
                ('puntaje', models.PositiveBigIntegerField(verbose_name='Puntaje')),
                ('alias', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablausuario')),
            ],
        ),
        migrations.CreateModel(
            name='TablaPrueba_Pregunta',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('puntaje', models.PositiveBigIntegerField(verbose_name='Puntaje')),
                ('idCategoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablapreguntas')),
                ('idPrueba', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablapruebas')),
            ],
        ),
        migrations.CreateModel(
            name='TablaPalabra',
            fields=[
                ('Palabra', models.TextField(primary_key=True, serialize=False)),
                ('Senia', models.TextField()),
                ('IdCategoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablacategoria')),
            ],
        ),
        migrations.CreateModel(
            name='TablaComentarios',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('texto', models.TextField(max_length=30)),
                ('alias', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='Tablas.tablausuario')),
            ],
        ),
    ]
