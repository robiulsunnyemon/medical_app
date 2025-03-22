# Generated by Django 5.1.7 on 2025-03-22 18:23

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0003_delete_medicinereview'),
    ]

    operations = [
        migrations.CreateModel(
            name='MedicineReview',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment', models.CharField(max_length=1000)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('medicine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reviews', to='store.medicine')),
            ],
        ),
    ]
