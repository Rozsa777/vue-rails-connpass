<template>
  <div id="event-list">
    <ul>
      <li class="event" v-for="event in events" :key="event.event_id">
        <h3 class="title"><a :href="event.event_url">{{ event.title }}</a></h3>
        <div class="start-end">{{ event.started_at }} 〜 {{ event.ended_at }}</div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: ['events']
}
</script>

<style lang="scss" scoped>
#event-list {
  .event {
    border: 1px;
    .title {
      font-size: 14px;
    }
  }
}
</style>
