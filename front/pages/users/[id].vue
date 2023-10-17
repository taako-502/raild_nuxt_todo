<template>
  <h1>Hello, {{ name }}</h1>
  <Todo :user_id="id" />
  <div>
    <Button :onClick="remove">Remove</Button>
  </div>
  <NuxtLink to="/users/new">Back</NuxtLink>
  <NuxtLink to="/">Back to Top</NuxtLink>
</template>

<script setup type="ts">
import Todo from "~/components/Todo.vue";
const id = ref(0)
const name = ref("")
const { $repository } = useNuxtApp();

const nameFromDB = async () => {
  const axios = $repository.getAxios();
  const route = useRoute();
  id.value = route.path.split("/")[2];
  const response = await axios.get(`/api/users/${id.value}`)
  if (!response || !response.data || !response.data.name) return;
  name.value = response.data.name
}
nameFromDB()

const remove = async () => {
  if (!window.confirm('削除しますか？')) return

  const axios = $repository.getAxios();
  const route = useRoute();
  const id = route.path.split("/")[2];
  try {
    await axios.delete(`/api/users/${id}`)
    navigateTo("/")
  } catch (e) {
    alert(e)
  }
}
</script>
