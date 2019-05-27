<template>
  <div id="event-list">
    <ul>
      <li class="event-list__event" v-for="event in events" :key="event.event_id">
        <h3 class="event-list__event--title">{{ event.title }}</h3>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: ['events']
}
</script>
