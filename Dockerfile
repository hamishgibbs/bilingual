FROM jupyter/all-spark-notebook

COPY requirements.txt ./

RUN python -m pip install -r ./requirements.txt

EXPOSE 8888

CMD ["jupyter-notebook", "--no-browser", "--port=8888"]
