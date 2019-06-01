<template>
  <div id="search-conditoin-container">
    <dl class="conditoin">
      <dt class="conditoin-name">都道府県</dt>
      <dd class="conditoin-item">
        <input type="text">
      </dd>
    </dl>
    <dl class="conditoin">
      <dt class="conditoin-name">開催日</dt>
      <dd class="conditoin-item">
        <datepicker v-model="params.from" placeholder="From" format="yyyy-MM-dd"></datepicker>
        <datepicker v-model="params.to" placeholder="To" format="yyyy-MM-dd"></datepicker>
      </dd>
    </dl>
    <dl class="conditoin">
      <dt class="conditoin-name">キーワード</dt>
      <dd class="conditoin-item">
        <input v-model.trim="params.keyword" type="text">
      </dd>
    </dl>
    <button @click="searchEvent">検索</button>
    <list :events="events"></list>
  </div>
</template>

<script>
import List from './list.vue'
import Datepicker from 'vuejs-datepicker';
import axios from 'axios';

export default {
  data: function() {
    return {
      events: [],
      params: {
        from: '',
        to: '',
        keyword: '',
      }
    }
  },
  components: {
    List,
    Datepicker,
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
      if(this.params.keyword) {
        params.keyword = this.params.keyword
      }
      return this.params
    }
  }
}
</script>

<style lang="scss" scoped>
#search-conditoin-container {
  .conditoin {
    .conditoin-item {
      display: flex;
    }
  }
}
</style>
