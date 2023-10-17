<template>
  <form @submit.prevent="post">
    <label for="content">Todo: </label>
    <input id="content" v-model="content" type="text" name="content" />
    <button type="submit">submit</button>
  </form>
</template>

<script setup lang="ts">
import { AxiosError } from 'axios'

const props = defineProps<{
  user_id: number
}>()

const content = ref('')
const contentErrors = ref([])

const post = async () => {
  const { $repository } = useNuxtApp()
  const axios = $repository.getAxios()
  contentErrors.value = []
  try {
    // 親コンポネントでAPIを叩く
    const response = await axios.post(`/api/users/${props.user_id}/tasks`, {
      content: content.value,
    })
    content.value = ''
  } catch (e: unknown) {
    console.error(e)
    if (!(e instanceof AxiosError)) {
      return
    }
    // contentErrors.value = e.response?.data?.content
  }
}
</script>
