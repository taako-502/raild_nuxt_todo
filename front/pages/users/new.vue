<template>
  <section>
    <div>
      <h1>New user</h1>
      <form @submit.prevent="post">
        <label for="name">Name: </label>
        <input id="name" v-model="name" type="text" name="name" />
        <button type="submit">submit</button>
      </form>
      <p v-for="error in nameErrors" :key="error" class="error-msg">
        {{ error }}
      </p>
    </div>
    <NuxtLink to="/">Back</NuxtLink>
  </section>
</template>

<script setup lang="ts">
import { AxiosError } from 'axios'

const name = ref('')
const nameErrors = ref([])

const post = async () => {
  const { $repository } = useNuxtApp()
  const axios = $repository.getAxios()
  nameErrors.value = []
  try {
    const response = await axios.post('/api/users', { name: name.value })
    if (!response || !response.data || !response.data.id) return
    const router = useRouter()
    router.push(`${response.data.id}`)
  } catch (e: unknown) {
    console.error(e)
    if (!(e instanceof AxiosError)) {
      return
    }
    nameErrors.value = e.response?.data?.name
  }
}
</script>

<style scoped lang="scss">
.error-msg {
  margin: 0;
  color: red;
}
</style>
