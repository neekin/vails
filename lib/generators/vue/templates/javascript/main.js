import Vue from 'vue'
import App from './app.vue'
import router from "./router";
import store from "./store";
import api from './api'

Vue.prototype.$api = api
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})