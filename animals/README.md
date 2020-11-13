# README
1- En primer lugar para adaptar esto a un proyeto de rails  debemos crearlo con rails _5.2.4.4_ new animals -d postgresql (especificando el uso de postrgres)
2- Se creo un diagrama en la carpeta raiz en el que se explica que los animales pueden ser tanto perros como, gatos, como vacas
3- Luego debemos crear los modelos involucrados en el ejemplo que serian Animal el objeto padre y sus 3 elementos hijos Dog, Cat, Cow, los cuales para hacer mas ordenado el proyecto estran relacionados de manera polimorfica con su elemento padre, con esto lograremos a travez de metodos simple la creacion de los animales sin el uso de de los condicionales 
    rails g model Animal name animalable:references{polymorphic}
    rails g model Dog 
    rails g model Cat
    rails g model Cow
    Creamos la base de datos con rails db:create
    Posteriormente luego de revisar las migraciones debemos correr las migraciones con rails db:migrate
4- Con los modelos debemos configurar sus relaciones:
    
    Modelo animal 
    class Animal < ApplicationRecord
        belongs_to :animalable, polymorphic: true
    end

    Modelos Cat, Cow, Dog (todos tienen la misma relacion)
    class Cat/Cow/Dog < ApplicationRecord
        has_many :animals, as: :animalable
    end
5- Con lo anterior siguiendo el ejemplo a analizar ahora la creacion de tus animales depende directamente del padre solamente se modifican el tipo de animal por lo mismo para crear un animal ahora debemos identificar el tipo para luego crear este nuevo animal de tipo gato

Ej. Animal.create(name: "Juan", animalable: (Cat.create) En este caso creamos un gato llamado juan pero dejando registrada el ingreso de un nuevo gato
    Animal.create(name: "Pepo", animalable: (Dog.create) En este caso creamos un perro llamado pepe pero dejando registrada el ingreso de un nuevo perro
    Animal.create(name: "Ana", animalable: (Cow.create) En este caso creamos una vaca llamada Ana pero dejando registrada el ingreso de una nueva vaca 