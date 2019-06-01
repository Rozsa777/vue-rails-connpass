import Vue from 'vue/dist/vue.esm.js'
import Search from './components/search.vue'
import List from './components/list.vue'

new Vue({
  el: '#app',
  components: {
    'search': Search,
    'list': List,
  }
});


