const express = require('express');
const server = express();
const parser = require('body-parser');
const jwt = require('jsonwebtoken');
const userService = require('./services/userService');
const bcrypt = require('bcrypt');
const config = require('./configuration');
const cors = require('cors');

const PORT = 3500;

server.use(parser.json());
server.use(parser.urlencoded({ extended: true}));

server.use(cors());

// status api
server.get('/status',(req,res)=>{
    res.json({
        message : 'Service is up'
    });
});

// registration
server.post('/users/register',(req,res)=>{
    const user = req.body;
    userService.signup(user,(err,response)=>{
        if(err){
            res.status(400).json({
                message: err
            })
        }else{
            res.status(200).json({
                message: response
            })
        }
    })
});

// authentication 
server.post('/users/authenticate',(req,res)=>{
    console.log('hitttttttt');
    const email = req.body.username;
    userService.findUser(email,(err,data)=>{
        if(err){
            res.status(401).json({
                message: 'Invalid Credentials'
            });
        }
        else{
            //console.log('Length ',data.length);
            if(data.length === 0){
                res.status(401).json({
                    message: 'Invalid Credentials'
                });
            }else{
                console.log(data);
                let isValidPassword = bcrypt.compareSync(req.body.password,data.password,10);
                if(isValidPassword){
                    //generate jwt token
                    const payload = {
                        firstName: data.firstName,
                        lastName: data.lastName,
                        email: email,
                        password: data.password
                    }
                    let token = jwt.sign(payload,config.secretKey,{
                        expiresIn: '1h'
                    });
                    res.json({
                        message: 'Success',
                        token: token
                    });
                }else{
                    res.status(401).json({
                        message: 'Invalid Credentials'
                    });
                }
            }
        }
    })
});
server.post('/users/post/add',(req,res)=>{
    const postInfo = req.body;
    console.log(postInfo);
    userService.writePost(postInfo,(err,response)=>{
        if(err){
            res.status(400).json({
                message: err
            })
        }else{
            res.status(200).json({
                message: response
            })
        }
    })
});
server.get('/users/fetch/post/:email',(req,res)=>{
    let email = req.params.email;
    userService.getPosts(email,(err,response)=>{
        if(err){
            res.status(400).json({
                message: err
            })
        }else{
            res.status(200).json(response)
        }
    })
});
server.get('/users/fetch/selfpost/:email',(req,res)=>{
    let email = req.params.email;
    userService.getSelfPosts(email,(err,response)=>{
        if(err){
            res.status(400).json({
                message: err
            })
        }else{
            res.status(200).json(response)
        }
    })
});
server.listen(PORT,()=>{
    console.log(`Server is started at ${PORT}`);
});
