<template>
  <h1>Hello, {{ name }}</h1>
  <Todo v-model:content="content" :user_id="id" :post="addTodo" />
  <div>
    <Button :onClick="removeUser">Remove</Button>
  </div>
  <NuxtLink to="/users/new">Back</NuxtLink>
  <NuxtLink to="/">Back to Top</NuxtLink>
</template>

<script setup lang="ts">
import Todo from '~/components/Todo.vue'
import { AxiosError } from 'axios'
const id = ref(0)
const name = ref('')
const content = ref('')
const contentErrors = ref<AxiosError[]>([])
const { $repository } = useNuxtApp()

const nameFromDB = async () => {
  const axios = $repository.getAxios()
  const route = useRoute()
  id.value = Number(route.path.split('/')[2])
  const response = await axios.get(`/api/users/${id.value}`)
  if (!response || !response.data || !response.data.name) return
  name.value = response.data.name
}
nameFromDB()

const removeUser = async () => {
  if (!window.confirm('ユーザを削除しますか？')) return

  const axios = $repository.getAxios()
  const route = useRoute()
  const id = route.path.split('/')[2]
  try {
    await axios.delete(`/api/users/${id}`)
    navigateTo('/')
  } catch (e) {
    alert(e)
  }
}

const addTodo = async () => {
  const { $repository } = useNuxtApp()
  const axios = $repository.getAxios()
  contentErrors.value = []
  try {
    // 親コンポネントでAPIを叩く
    await axios.post(`/api/users/${id.value}/tasks`, {
      content: content.value,
    })
    content.value = ''
  } catch (e: unknown) {
    console.error(e)
    if (!(e instanceof AxiosError)) {
      return
    }
    contentErrors.value = e.response?.data?.content
  }
}
</script>
