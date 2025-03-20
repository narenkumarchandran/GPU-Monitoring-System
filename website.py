from flask import Flask, render_template, request
import mysql.connector
import pandas as pd
import os

app = Flask(__name__)

# Connect to the database
def get_db_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='naren',
        database='project1'
    )

# Define the route to render the main page with the dropdown
@app.route('/')
def index():
    return render_template('indexnew.html')

# Route to execute the selected stored procedure and display results
@app.route('/execute', methods=['POST'])
def execute_procedure():
    proc_name = request.form['proc_name']  # Get procedure name from form
    db_conn = get_db_connection()
    cursor = db_conn.cursor()

    # Prepare and execute the SQL call to the selected stored procedure
    sql = f"CALL {proc_name}();"
    cursor.execute(sql)
    results = cursor.fetchall()

    # Convert the result to a DataFrame for HTML rendering
    df = pd.DataFrame(results, columns=[desc[0] for desc in cursor.description])
    cursor.close()
    db_conn.close()

    # Save DataFrame as HTML for rendering
    df_html = df.to_html(classes='dataframe', index=False, border=0)
    
    # Render the template with data
    return render_template('sql-data.html', table=df_html)

if __name__ == '__main__':
    app.run(debug=True)
