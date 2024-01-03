<template>
    <input type="checkbox" v-model="checked" :disabled="disabled" :checked="done" @change="onToggleChange()" />
</template>

<script lang="ts">
import { defineComponent } from 'vue';
export default defineComponent({
  data() {
    return {
      checked: this.done
    }
  },
  props: {
    done: {
      type: Boolean,
      default: () => false
    },
    disabled: {
      type: Boolean,
      default: () => false
    }
  },
  methods: {
    onToggleChange() {
      console.log({status: this.checked});
      this.$emit('change', {status: this.checked})
    }
  },
  emits: ['change']
})
</script>

<style lang="scss" scoped>
</style>