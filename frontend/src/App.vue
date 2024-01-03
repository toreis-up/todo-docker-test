<script lang="ts">
import Header from '~/components/Header/Header.vue'
import CardList from '~/components/CardList.vue'
import Button from './components/Button/Button.vue';
import { defineComponent } from 'vue';
import { Configuration, DefaultApi, TodosGet200Response } from './types/';

export default defineComponent({
  data() {
    return {
      items: {
        items: [
          {
            id: 1,
            title: "Test1",
            isDone: true,
          },
          {
            id: 2,
            title: "Test2",
            isDone: false,
          }
        ]
      } as TodosGet200Response,
      fetcher: undefined as unknown as DefaultApi,
    }
  },
  methods: {
    async onToggle(e: {id: number, status: boolean}) {
      await this.fetcher.todosIdPatch({id: e.id}, {body: {
        isDone: e.status
      }})
    }
  },
  components: {CardList, Header, Button},
  async created() {
    const config = new Configuration({
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }
    })
    this.fetcher = new DefaultApi(config);
    this.items = await this.fetcher.todosGet()
  },
})
</script>

<template>
  <div class="container">
    <div class="header">
      <Header title="Todo App" />
    </div>
    <div class="main">
      <div class="btn-container">
        <Button class="btn" label="Test Button!" />
      </div>
      <div>
        <CardList :items="items" @change="(e) => onToggle(e)" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.container {
  display: flex;
  flex-direction: row;
  justify-content: center;
}
.header {
  position:absolute;
  top: 0;
  left: 0;
}
.btn-container {
  display: grid;
  padding: 10px;
}
.btn {
  justify-self: end;
}
.main {
  margin-top: 64px;
  display: flex;
  color: black;
  flex-direction: column;
  max-height: calc(100vh - 64px);
  overflow-y: scroll;
  justify-content: start;
}

.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
