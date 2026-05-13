# Prácticas de Visión por Computadora (PIV)

Este repositorio contiene una serie de prácticas relacionadas con visión por computadora, procesamiento de imágenes y aprendizaje automático. Cada práctica está organizada en su propia carpeta e incluye un cuaderno Jupyter (`.ipynb`) con ejercicios y ejemplos prácticos.

## Estructura del repositorio

- **enviroment.yml**: Archivo de entorno para instalar las dependencias necesarias con Conda.
- **install.bat**: Script para facilitar la instalación del entorno en Windows.
- **practica2/** a **practica9/**: Carpetas que contienen los cuadernos de cada práctica.
- **practica7/**: Incluye clasificadores Haar Cascade XML para detección de objetos.
- **practica8/**: Incluye un modelo entrenado en formato Keras (`mi_red_mnist.keras`).

## Prácticas incluidas

- **practica2**: Primeros pasos con procesamiento de imágenes.
- **practica3**: Operaciones avanzadas y filtros.
- **practica4**: Segmentación y análisis de imágenes.
- **practica5**: Detección de bordes y contornos.
- **practica6**: Morfología matemática.
- **practica7**: Detección de objetos con Haar Cascades.
- **practica8**: Clasificación de dígitos con redes neuronales (MNIST).
- **practica9**: Temas avanzados y cierre del curso.

## Instalación

1. Instala [Anaconda](https://www.anaconda.com/products/individual) o [Miniconda](https://docs.conda.io/en/latest/miniconda.html).
2. Ejecuta el siguiente comando en la terminal para crear el entorno:

   ```sh
   conda env create -f enviroment.yml
   ```

3. Activa el entorno:

   ```sh
   conda activate piv
   ```

4. (Opcional) En Windows, puedes usar el script `install.bat` para automatizar la instalación.

## Uso

Abre los cuadernos `.ipynb` de cada práctica con Jupyter Notebook o JupyterLab y sigue las instrucciones dentro de cada uno.

## Créditos

Repositorio para prácticas de la asignatura de Procesamiento de Información Visual.
