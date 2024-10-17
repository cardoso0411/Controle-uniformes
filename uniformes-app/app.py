from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
from datetime import datetime, timedelta

app = Flask(__name__)

# Conectar ao banco de dados MySQL
def conectar():
    return mysql.connector.connect(
        host='localhost',  # Altere se necessário
        user='root',  # Seu usuário MySQL
        password='8972013',  # Sua senha MySQL
        database='uniformes_db'  # Nome do banco de dados
    )

# Página inicial
@app.route('/')
def index():
    return render_template('index.html')

# Cadastro de funcionários
@app.route('/cadastro', methods=['GET', 'POST'])
def cadastro():
    if request.method == 'POST':
        nome = request.form['nome']
        matricula = request.form['matricula']
        
        conn = conectar()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO funcionarios (nome, matricula) VALUES (%s, %s)", (nome, matricula))
        conn.commit()
        conn.close()
        return redirect(url_for('index'))
    
    return render_template('cadastro.html')

# Registrar entrega
@app.route('/entrega', methods=['GET', 'POST'])
def entrega():
    if request.method == 'POST':
        matricula = request.form['matricula']
        camisa = 'camisa' in request.form
        calca = 'calca' in request.form
        observacao = request.form['observacao']
        
        # Verifica se pode registrar nova entrega
        conn = conectar()
        cursor = conn.cursor()
        cursor.execute("SELECT id FROM funcionarios WHERE matricula = %s", (matricula,))
        funcionario = cursor.fetchone()
        
        if funcionario:
            funcionario_id = funcionario[0]
            cursor.execute("SELECT data_entrega FROM entregas WHERE funcionario_id = %s ORDER BY data_entrega DESC LIMIT 1", (funcionario_id,))
            ultima_entrega = cursor.fetchone()

            if ultima_entrega:
                data_ultima_entrega = datetime.strptime(ultima_entrega[0], '%Y-%m-%d')
                seis_meses_depois = data_ultima_entrega + timedelta(days=180)
                if datetime.now() < seis_meses_depois:
                    return f"Entrega não permitida. Próxima entrega permitida após: {seis_meses_depois.strftime('%d/%m/%Y')}"
            
            # Registrar nova entrega, verificando camisa e calça separadamente
            data_entrega = datetime.now().strftime('%Y-%m-%d')
            cursor.execute("INSERT INTO entregas (funcionario_id, data_entrega, camisa, calca, observacao) VALUES (%s, %s, %s, %s, %s)", 
                           (funcionario_id, data_entrega, camisa, calca, observacao))
            conn.commit()
        conn.close()
        return redirect(url_for('index'))
    
    return render_template('entrega.html')

# Consulta de registros
@app.route('/consulta', methods=['GET', 'POST'])
def consulta():
    registros = []
    consulta_realizada = False

    if request.method == 'POST':
        matricula = request.form['matricula']

        conn = conectar()
        cursor = conn.cursor(dictionary=True)
        query = """
            SELECT f.nome, f.matricula, 
                   CASE WHEN e.camisa = 1 THEN e.data_entrega ELSE NULL END AS data_camisa, 
                   CASE WHEN e.calca = 1 THEN e.data_entrega ELSE NULL END AS data_calca,
                   e.observacao
            FROM entregas e
            JOIN funcionarios f ON e.funcionario_id = f.id
            WHERE f.matricula = %s
            ORDER BY e.data_entrega DESC
        """
        cursor.execute(query, (matricula,))
        registros = cursor.fetchall()
        conn.close()

        consulta_realizada = True

    return render_template('consulta.html', registros=registros, consulta_realizada=consulta_realizada)

if __name__ == '__main__':
    app.run(debug=True)
