import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Search from '../components/search.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Search },
    { path: '/event', component: Search },
  ],
})
