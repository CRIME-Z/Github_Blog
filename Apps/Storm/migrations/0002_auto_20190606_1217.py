# Generated by Django 2.1.7 on 2019-06-06 12:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Storm', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bigcategory',
            name='description',
            field=models.TextField(default='EOSONES的个人网站，记录生活的瞬间，分享学习的心得', help_text='用来作为SEO中description,长度参考SEO标准', max_length=240, verbose_name='描述'),
        ),
        migrations.AlterField(
            model_name='category',
            name='description',
            field=models.TextField(default='EOSONES的个人网站，记录生活的瞬间，分享学习的心得', help_text='用来作为SEO中description,长度参考SEO标准', max_length=240, verbose_name='描述'),
        ),
        migrations.AlterField(
            model_name='tag',
            name='description',
            field=models.TextField(default='EOSONES的个人网站，记录生活的瞬间，分享学习的心得', help_text='用来作为SEO中description,长度参考SEO标准', max_length=240, verbose_name='描述'),
        ),
    ]
