<template>
  <form @submit.prevent="post">
    <label for="content">Todo: </label>
    <input
      id="content"
      type="text"
      name="content"
      :value="content"
      @input="emit('update:content', ($event.target as HTMLInputElement).value)"
    />
    <button type="submit">submit</button>
  </form>
</template>

<script setup lang="ts">
const props = defineProps<{
  user_id: number
  content: string
  post: () => Promise<void>
}>()

const emit = defineEmits<{
  (event_: 'update:content', text: string): void
}>()
</script>
