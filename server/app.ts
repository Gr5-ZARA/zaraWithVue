import express, { Express, json, urlencoded } from 'express';
import cors from 'cors';
import routerUser from "./routes/users"
import routeOrder from '../server/routes/orders'
import routeProd from '../server/routes/products'
import routeHelp from '../server/routes/help';
import connection from './connection';

const app: Express = express();
app.use(cors());
app.use(json());
app.use(urlencoded({ extended: true }));
app.get('/getAll',(req,res)=>{
    connection.query('SELECT * FROM users',(err,result)=>{
        if(err) res.json(err)
        res.json(result)
    })
})

app.delete('/removeById/:id',(req,res)=>{
    connection.query('DELETE FROM users WHERE userid=?',[req.params.id],(err,results)=>{
        if(err) res.json(err)
        connection.query('DELETE FROM users WHERE userid=?',[req.params.id],(err,result)=>{
            if(err) res.json(err);
            res.json('user removed')
        })
    })

})
// Import products route
app.use('/api', routeHelp);
app.use('/api/orders',routeOrder)
app.use("/api/user",routerUser)
app.use("/api/products",routeProd)
// use path for controller methods

export default app;
