# Generated by Django 4.1.7 on 2023-06-05 21:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Tablas', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='TablaCategoria',
            fields=[
                ('IdCategoria', models.PositiveSmallIntegerField(primary_key=True, serialize=False, verbose_name='IdCategoria')),
                ('Categoria', models.TextField(max_length=30)),
            ],
        ),
    ]