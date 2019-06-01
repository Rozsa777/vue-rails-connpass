<template>
  <div id="search-conditoin-container">
    <dl class="conditoin">
      <dt class="conditoin-name">都道府県</dt>
      <dd class="conditoin-item">
        <input type="text" placeholder="都道府県">
      </dd>
    </dl>
    <dl class="conditoin">
      <dt class="conditoin-name">開催日</dt>
      <dd class="conditoin-item">
        <input type="text" placeholder="From">
      </dd>
      <dd class="conditoin-item">
        <input type="text" placeholder="To">
      </dd>
    </dl>
    <dl class="conditoin">
      <dt class="conditoin-name">キーワード</dt>
      <dd class="conditoin-item">
        <input v-model.trim="keyword" type="text" placeholder="キーワード">
      </dd>
    </dl>
    <button @click="searchEvent">検索</button>
    <list :events="events"></list>
  </div>
</template>

<script>
import List from './list.vue'
import axios from 'axios';

export default {
  data: function() {
    return {
      events: [],
      keyword: '',
    }
  },
  components: {
    List,
  },
  methods: {
    searchEvent: function() {
      this.reset()
      const uri = '/api/connpass/event'
      axios.get(uri, {params: this.createQueryParam()}).then((res) => {
        for(let event of res.data.events) {
          this.events.push(event)
        }
        console.log(this.events)
      }, (error) => {
        console.log(error)
      })
    },
    reset: function() {
      this.events = []
    },
    createQueryParam: function() {
      let params = {}
      if(this.keyword) {
        params.keyword = this.keyword
      }
      return params
    }
  }
}
</script>

