# Консольное приложение `astrological_forecast`
###### Язык написания - Ruby

## Описание приложения:
Парсер зодиакальных гороскопов с сайта https://orakul.com. Программа спрашивает у пользователя дату рождения, а в качестве результата
выводит в консоль название знака зодиака, диапазон дат ему соответствующий, заголовок и сам прогноз на текущую дату, на следующий день,
на неделю, на месяц или на год по запросу пользователя. Также есть возможность выбрать разновидность (тип) гороскопа.

## Установка и запуск:

**Примечание:** Это ruby-приложение, поэтому необходимо
чтобы на вашем компьютере был установлен интерпретатор Ruby.

1. Перенесите содержимое данного репозитория на свой компьютер
```
git clone git@github.com:ProfessorNemo/astrological_forecast.git
```
2. Чтобы запустить приложение в этой же директории
следует воспользоваться следующей командой:
```
ruby forecast.rb
```

## Пример работы программы:
```
Когда вы родились (укажите дату в формате ДД.ММ, например, 31.12)
19.05

Выберите разновидность гороскопа? Введите число от 1 до 8:

1. Общий
2. Любовный
3. Семейный
4. Карьерный
5. Здоровье
6. Тинейджер
7. Флирт
8. Друзья

> 1

Выберите период прогнозирования? Введите число от 1 до 5:

1. На сегодня
2. На завтра
3. На неделю
4. На месяц
5. На год

> 1

Телец:
Апрель 21 - Май 21,
Я приобретаю! Ключевая особенность - практичность.
Тельцы обладают благородным и независимым характером. Имея силу, они, как ни странно, не спешат ее использовать, 
дожидаясь наиболее благоприятного случая, но частенько упуская его. Упорный труд, а не везение, постоянство, а не 
порыв - вот ключ к успеху Тельцов в жизни.

Общий гороскоп на сегодня, 21 мая, 2022:

Если кто-то действует Вам на нервы, просто игнорируйте. Это ведь такая мелочь! Лучше сосредоточить силы на более 
толковых делах. Рутинное и предсказуемое - безопасно. Но важно понять, почему Вы так держитесь за него. Да, это
стабильность - но не теряете ли Вы интересные возможности? Со временем зона комфорта может стать не такой уж 
комфортной. Стоит подумать о том, чтобы выйти из нее раньше, чем это случится.
```
