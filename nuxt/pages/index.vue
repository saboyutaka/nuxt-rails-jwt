<template>
  <section class="flex flex-col items-center">
    <div v-for="todo in todos" :key="todo.id" class="w-full sm:w-3/4 lg:w-1/2 rounded shadow-md  hover:shadow-lg transition-shadow mb-4">
      <div class="px-6 py-4">
        <div class="font-bold text-xl mb-2">{{ todo.content }}</div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  asyncData({ $axios }) {
    return $axios.get('/v1/todos').then(res => {
      return { todos: res.data };
    });
  },
};
</script>
