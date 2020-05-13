<template>
  <div class="flex flex-col items-center w-full sm:w-3/4 lg:w-1/2 mx-auto">
    <form class="w-full mb-8">
      <div class="flex items-center border-b border-b-2 border-teal-500 py-2">
        <input
          class="appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
          type="text"
          placeholder="Todoを入力"
          v-model="newTodo"
        />
        <button
          class="flex-shrink-0 bg-teal-500 hover:bg-teal-700 border-teal-500 hover:border-teal-700 text-sm border-4 text-white py-1 px-2 rounded"
          type="button"
          @click="postTodo"
        >
          追加
        </button>
        <button class="flex-shrink-0 border-transparent border-4 text-teal-500 hover:text-teal-800 text-sm py-1 px-2 rounded" type="button" @click="clearTodo">
          キャンセル
        </button>
      </div>
    </form>
    <section class="flex flex-col items-center w-full">
      <div v-for="todo in todos" :key="todo.id" class="w-full rounded shadow-md  hover:shadow-lg transition-shadow mb-4">
        <div class="px-6 py-4">
          <div class="font-bold text-xl mb-2">{{ todo.content }}</div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      todos: [],
      newTodo: '',
    };
  },
  asyncData({ $axios }) {
    return $axios.get('/v1/todos').then(res => {
      return { todos: res.data };
    });
  },
  methods: {
    postTodo() {
      this.$axios
        .post('/v1/todos', {
          content: this.newTodo,
        })
        .then(res => {
          this.todos.unshift(res.data);
          this.newTodo = '';
        })
        .catch(e => {
          console.error(e);
        });
    },

    clearTodo() {
      this.newTodo = '';
    },
  },
};
</script>
