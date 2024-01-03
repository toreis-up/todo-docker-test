<template>
  <div>
    <div class="container">
      <div class="checkbox mx-10">
        <CheckBox :done="isDone" @change="(e) => $emit('change', {...e})" />
      </div>
      <div class="title mx-10">
        <h2>{{ title }}</h2>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import CheckBox from "./CardParts/CheckBox.vue";
import { defineComponent } from "vue";
export default defineComponent({
  data() {
    return {
      isDone: this.isDone,
    };
  },
  props: {
    title: {
      type: String,
      required: true,
    },
    isDone: {
      type: Boolean,
      default: () => false
    }
  },
  emits:['change'],
  components: { CheckBox },
});
</script>

<style lang="scss" scoped>
.container {
  justify-content: start;
  min-width: 70vw;
  display: flex;
  flex-direction: row;
  border-radius: 0px 10px;
  background: #d9d9d9;
  flex-wrap: wrap;
  min-height: 3em;
  flex-shrink: 0;
}

.checkbox {
  display: inherit;
}

.mx-10 {
  margin: 0 10px;
}

.title {
  font-family: Arial, Helvetica, sans-serif
}
</style>
