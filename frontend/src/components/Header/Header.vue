<template>
  <div class="header">
    <h1 class="title">
      {{ title }}
    </h1>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  props: {
    title: {
      type: String,
      required: true
    }
  }
})
</script>

<style lang="scss" scoped>
.header {
  height: 64px;
  width: 100vw;
  background: #d9d9d9;
  font-family:Arial, Helvetica, sans-serif;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  justify-content: center;
  text-align: start;
}

.title {
  margin: 0 10px;
  color: black;
  font-size: 1.5rem;
}
</style>