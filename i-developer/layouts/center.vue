<script setup lang="ts">
const props = defineProps({
  separator: {
    type: Boolean,
    default: true,
  },
})
</script>

<template>
  <div class="slidev-layout center bg-[#f8f9fa] w-full h-full px-12 py-10 flex flex-col justify-center items-center text-center">
    <div class="my-auto w-full z-10 relative">
      <div class="inline-block text-center">
        <div class="slide-title">
          <slot />
        </div>
        <div v-if="separator" class="w-full h-2 bg-[#3b82f6] mt-8 rounded-full"></div>
      </div>
    </div>
  </div>
</template>
