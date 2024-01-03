<script lang="ts">
import { PropType, defineComponent } from 'vue';
import Card from './Todo/Card.vue';
import { TodosGet200Response } from '~/types';
export default defineComponent({
  components: {Card},
  props: {
    items: {
      type: Object as PropType<TodosGet200Response>,
      required: true,
    }
  },
  methods: {
    onToggleCheckbox(e: {status: Boolean, id: Number}) {
      console.log(e)
      this.$emit('change', e);
    }
  },
  emits: ['change']
})
</script>

<template>
  <div v-for="(item) in items.items">
    <Card class="card" :title="item.title || 'Not Set'" :is-done="item.isDone" @change="(e) => onToggleCheckbox({...e, id: item.id})" />
  </div>
</template>

<style lang="scss">

</style>