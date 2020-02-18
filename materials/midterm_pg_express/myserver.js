const path = require('path')
const express = require('express')
const app = express()
// slug - landing page
app.get('/', function(req, res) {
    res.end('Hello World!')
})

// slug - home page
app.get('/home', function(req, res) {
    res.end('<h1>This is the home page</h1>')
})

// slug - get all countries
app.get('/countries', function(req, res1) {
    
    // logic

    require('dotenv').config()
    const { Pool } = require('pg')
    const pool = new Pool({
      user: `${process.env.DB_USER}`, 
      host: `${process.env.DB_HOST}`,
      database: `${process.env.DB_DATABASE}`, 
      password: `${process.env.DB_PASSWORD}`, 
      port: process.env.DB_PORT, 
      ssl:true,  
    })
        
    pool.query('SELECT HR.get_countryid_countryname(5)', (err, res) => {
      console.log(res.rows)
      console.log("length: ",res.rows.length)

      let tbody = ``;
      for(let i=0;i<res.rows.length;i++){
        const result = res.rows[i].get_countryid_countryname; // (IT,Italy)
        const rec = result.split(","); // rec[0]=(IT  rec[1]=Italy)

        const recid_0 =   rec[0].replace(/\(|\)/g,'');
        const recname_0 = rec[1].replace(/\)|"/g,'');

        tbody += `
            <tr>
                <td style="background-color:#5533ff">${recid_0}</td>
                <td>${recname_0}</td>
            </tr>
        `;
      }
   
      res1.end(`
            
            <h1>LIST OF ALL COUNTRIES</h1>
            <table border=1>
                <thead>
                    <tr>
                        <th style="background-color:#5533ff">COUNTRY ID</th>
                        <th>COUNTRY NAME</th>
                    </tr>
                </thead>
                <tbody>
                    ${tbody}
                </tbody>
            </table>
        `)
      pool.end()
    })
  
    
})

app.listen(3000)



//----------------------------
// app.use(express.static(process.argv[3] || path.join(__dirname, 'public')))
// app.listen(process.argv[2])