<script setup lang="ts">
import SlideHeader from '../components/SlideHeader.vue'

const props = defineProps({
  separator: {
    type: Boolean,
    default: true,
  },
})
</script>

<template>
  <div class="slidev-layout default bg-[#f8f9fa] w-full h-full px-12 py-10 flex flex-col">
    <SlideHeader :separator="separator">
      <slot name="header" />
    </SlideHeader>
    
    <div class="flex-1 w-full text-[#374151] min-h-0">
      <slot name="body" />
    </div>
  </div>
</template>
