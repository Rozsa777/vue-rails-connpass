<template>
  <div id="event-list">
    <ul>
      <li class="event" v-for="event in events" :key="event.event_id">
        <h3 class="title"><a :href="event.event_url">{{ event.title }}</a></h3>
        <div class="start-end">{{ formatDate(event.started_at, 'MM-DD(ddd)') }} 〜 {{ formatDate(event.ended_at, 'MM-DD(ddd)') }}</div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: ['events'],
  methods: {
    formatDate: function(date, format) {
      const moment = require('moment')
      moment.locale('ja')
      return moment(date).format(format)
    }
  }
}
</script>

<style lang="scss" scoped>
#event-list {
  .event {
    border-bottom: solid 1px #d3d3d3;
    .title {
      font-size: 14px;
    }
  }
}
</style>
