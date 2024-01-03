<template>
    <input :class="'my-btn ' + (disabled ? 'disabled' : '')" type="button" @click="onClick()" :value="label" />
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  props: {
    label: {
      type: String,
      required: true,
    },
    disabled: {
      type: Boolean,
      default: () => false
    }
  },
  methods: {
    onClick() {
      this.$emit('click')
    }
  },
  emits: ['click']
})
</script>

<style lang="scss">
.my-btn {
  padding: 10px 20px;
  border-radius: 10px;
  background: #45C6EF;
  color: black;

  &:hover {
    background-color: #45EFB2;
  }
}

.disabled{
    background-color: #A7EAFF;
    color: #999;
  }
</style>