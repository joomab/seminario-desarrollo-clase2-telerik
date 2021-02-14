# Seminario Desarrollo - Clase 2 - Implementación de Telerik

Hola compañeros, para correr este proyecto unicamente deben clonar el repositorio y echarlo a andar con su Visual Studio.

## Base de datos.

- La base de datos debe llamarse dbExamen2
- Ejecutar el siguiente script para crear la tabla dentro de esta BD.

```
USE [dbExamen2]
GO

/****** Object:  Table [dbo].[libro]    Script Date: 13-Feb-21 10:06:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](200) NULL,
	[Editorial] [nvarchar](200) NULL,
	[AnioEdicion] [int] NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [date] NULL,
 CONSTRAINT [PK_libro] PRIMARY KEY CLUSTERED
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


```

- Por último, si es necesario y no les corre el proyecto, probablemente sea por la conexión a la BD. Solo deben modificar su Conection String en el web.config que se encuentra en la raíz del proyecto. (Se debe modificar la cadena de conexión con nombre "dbExamen2Entities2")

## Dependencias

- [Telerik] - Librería que se utiliza para mejorar la UI y la developer experience!
- [TelerikDoc] - Documentación del Grid que se utiliza en el proyecto.

## License

MIT

[//]: # "These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax"
[telerik]: https://www.telerik.com/
[telerikdoc]: https://demos.telerik.com/aspnet-ajax/grid/examples/data-editing/manual-crud-operations/defaultcs.aspx
