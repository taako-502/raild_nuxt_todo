<template>
  <section>
    <div>
      <h1>New user</h1>
      <form @submit.prevent="post">
        <label for="name">Name: </label>
        <input id="name" v-model="name" type="text" name="name" />
        <button type="submit">submit</button>
      </form>
    </div>
  </section>
</template>

<script setup lang="ts">
const name = ref("");

const post = async () => {
  const { $repository } = useNuxtApp();
  const axios = $repository.getAxios();
  const response = await axios.post("/api/users", { name: name.value });
  if (!response || !response.data || !response.data.id) return;
  const router = useRouter();
  router.push(`${response.data.id}`);
};
</script>
