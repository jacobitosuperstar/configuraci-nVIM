# MongoDB
## CheatSheet para y por Jacobo Bedoya


### Conceptos Fundamentales

1.**Base de datos**
: Totalidad de la información que va a estar en la apliación.

2.**Colección o Colecciones**
: Estas son el análogo a las tablas de SQL, por lo tanto representan todos los documentos de un mismo tipo. Tomando en cuenta el desarrollo se puede tomar las tablas de los diferentes modelos o clases desarrollados en la aplicación.

3.**Documentos**
: Son el análogo a los registros de la base de datos. Los cuales son representados en pares de claves y valores. Los nombres de los campos siempre son cadenas de texto, y los valores de estos, pueden ser, texto, números, vectores o listas, dechas, verdadero o falso, u objetos. La ventaja de estos es que pueden cambiar los campos de documentos a documento y la totalidad de la estructura de datos se puede ir cambiando sobre el tiempo.


**Crear Base de datos**
```
use <nombre de la base de datos>
```
Si no está creada se va a crear, y puedo usar el comando `db` para asegurarme de que la base de datos que cree o que estoy llamando es la que estoy usando.

**Mostrar todas las vaces de datos que he creado**

```
show dbs
```
Tener en cuanta que las bases de datos que están completamente vacías, no se muestran en la lista de colecciones, ya que no tienen información. Se debe de llenar con al menos un registro para que aparezca.

**¿Cómo crear colecciones?**

```
db.createCollection("<nombre de la colección>")
```

**¿Cómo mostrar las colecciones?**
```
show collections
```

**¿Cómo agregar elementos a la base de datos?**

```
db.<nombre de la colección>.insert({})
```
Si se agregan datos de esta manera, sino existe la colección, esta se crea. Se inserta un sólo elemento.

```
db.<nombre de la colección>.insertMany([{},{},{}])
db.<nombre de la colección>.insertMany(data)
```

**¿Cómo eliminar una colección?**
```
db.<nombre de la colección>.drop()
```

**¿Cómo eliminar una base de datos?**
```
use <nombre de la base de datos que vamos a eliminar>
drop.dropDatabase()
show dbs
```
Con esto, nos cercioramos de que vamos a eliminar la base de datos que realmente deseamos eliminar, eliminamos la base de datos y luego chequeamos si fue realmente eliminada o no.

**¿Cómo hago para ver todos los elementos que se encuentran en mi colección?**
```
db.<nombre de la colección>.find()
```
En caso de que quiera limitar la cantidad de productos que se van a mostrar, podemos usar lo siguiente
```
db.<nombre de la colección>.find().limit(<número máximo de elementos que queremos ver>)
```
**FILTROS**

Con el `.find()` también puedo filtrar los documentos de la siguiente manera:
```
db.<nombre de la colección>.find(
    {
        "campo en el que quiero filtrar": <filtro, sea valor o texto>
    }
    )
```
también podemos filtrar sub documentos:
```
db.<nombre de la colección>.find(
    {
        "campo.subcampo": <filtro, sea valor o texto que quiero aplicar en el subcampo>
    }
    )
```
en caso de que quiera hacer operaciones lógicas en el momento de la búsqueda también está:
```
db.<nombre de la colección>.find(
    {
        "campo en el que quiero filtrar": { $operador : valor o lógica del operador }
    }
    )
```
si queremos incluir varios operadores:
```
db.<nombre de la colección>.find(
    {
        "campo en el que quiero filtrar": {
            $operador : valor o lógica del operador,
            $operador : valor o lógica del operador
            }
    }
    )
```
**operadores**

`$exist`
: Devuelve todos los elementos que contienen o no ese campo. Puede tomar los valores true ó false.

`$eq`
: Devuelve todos los valores que son iguales a un valor específico.

`$gt`
: Devuelve todos los valores que son mayores al valor especificado.

`$gte`
: Devuelve todos los valores mayores o iguales al valor especificado

`$in`
: Devuelve los valores específicados en una lista o vectore de valores

*sintaxis*
```
{campo: { $in: [lista de valores separado por coma] } }
```

`$lt`
: Devuelve los valores menores al valor especificado

`$lte`
: Devuelve los valores menores o iguales al valor especificado

`$ne`
: Devuelve los valores diferentes al valor especificado

`$nin`
: Devuelve los valores diferentes a los valores específicados en una lista o vectore de valores

*sintaxis*
```
{campo: { $nin: [lista de valores separado por coma] } }
```

`$and`
: Hace la operación condicional Y

*sintaxis*
```
{ $and: [{condición 1},...,{condición n}] }
```
*o*
```
{condición 1,...,condición n}
```

`$sort`
: 

`$text`
:

`$search`
:

`meta`
:

**Editar un documento**
```
db.<nombre de la colección>.updateOne(
    {
        "campo en el que quiero filtrar": <filtro, sea valor o texto>
    },
    {
        $set: {"campo que voy a cambiar": <valor nuevo>}
    },
    )
```
de esta manera se edita el primer elemento que se encuentra en el filtro, en caso de que se quiera cambiar todos los elementos que tienen ese filtro, se hace lo siguiente:
```
db.<nombre de la colección>.update(
    {
        "campo en el que quiero filtrar": <filtro, sea valor o texto>
    },
    {
        $set: {"campo que voy a cambiar": <valor nuevo>}
    },
    {
        multi: true
    }
    )
```
también podemos usar de manera más elegante:
```
db.<nombre de la colección>.updateMany(
    {
        "campo en el que quiero filtrar": <filtro, sea valor o texto>
    },
    {
        $set: {"campo que voy a cambiar": <valor nuevo>}
    }
    )
```
Adicionalmente a actualizar, en caso de que sea sólo un documento, para no tener que hacer dos procedimientos, uno de borrado y uno de inserción, se hace:
```
db.<nombre de la colección>.replaceOne(
    {
        "campo en el que quiero filtrar": <filtro, sea valor o texto>
    },
    {
        "campo que voy a reemplazar": <valor nuevo>
    },
    )
```
**Eliminar un documento**

eliminar el primer documento que aparece cuando aplicamos el filtro:
```
db.<nombre de la colección>.deleteOne(
    {
        "campo en el que quiero filtrar": <filtro, sea valor o texto>
    }
    )
```
eliminar todos los documentos a los que se les aplica el filtro:
```
db.<nombre de la colección>.deleteMany(
    {
        "campo en el que quiero filtrar": <filtro, sea valor o texto>
    }
    )
```
eliminar todos los documentos de una colección
```
db.<nombre de la colección>.deleteMany()
```

**Funciones**

1. Para contar los elemenos de una colección agrego `.count()`
2. Para organizar los elementos de una colección agrego `.sort(filter)`, donde ascende es 1 y descendente es -1
3. Para eliminar las limintaciones de memoria preventivas que tiene MongoDB se puede agregar `allowDiskUse`, y darle el valor de `true` o `false`
