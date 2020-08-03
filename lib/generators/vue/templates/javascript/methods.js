import axios from 'axios'



export function get(request){
    return axios.get(request.url,request.config)
 }
 export function post(request){
     return axios.post(request.url,request.data,request.config)
 }

 export function destory(request){
     return axios.delete(request.url,request.config)
 }
 export function put(request){
    return axios.put(request.url,request.data,request.config)
}