<script setup lang="ts">
const props = defineProps({
  separator: {
    type: Boolean,
    default: true,
  },
})
</script>

<template>
  <div class="slidev-layout default bg-[#f8f9fa] w-full h-full px-12 py-10 flex flex-col" :class="{ 'no-separator': !separator }">
    <div class="flex-1 w-full text-[#374151]">
      <slot />
    </div>
  </div>
</template>
