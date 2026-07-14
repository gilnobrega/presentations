<script setup lang="ts">
import { useSlots } from 'vue'
import SlideHeader from '../components/SlideHeader.vue'
import LawCard from '../components/LawCard.vue'

const slots = useSlots()
const hasRight = !!slots.right

defineProps({
  part1Title: {
    type: String,
    default: 'Part 1'
  },
  part2Title: {
    type: String,
    default: 'Part 2'
  },
  part3Title: {
    type: String,
    default: 'Part 3'
  },
  separator: {
    type: Boolean,
    default: true
  }
})
</script>

<template>
  <div class="slidev-layout three-parts-layout bg-[#f8f9fa] w-full h-full px-12 py-10 flex flex-col">
    <SlideHeader :separator="separator">
      <slot name="header" />
    </SlideHeader>
    
    <div 
      class="grid gap-10 flex-1 min-h-0 text-[#374151]"
      :class="hasRight ? 'grid-cols-[2fr_1fr]' : 'grid-cols-1'"
    >
      <div class="w-full min-w-0 min-h-0 flex flex-col parts-cards">
        <v-clicks>
          <LawCard :title="part1Title">
            <slot name="part1" />
          </LawCard>
          <LawCard :title="part2Title">
            <slot name="part2" />
          </LawCard>
          <LawCard :title="part3Title">
            <slot name="part3" />
          </LawCard>
        </v-clicks>
      </div>
      
      <div v-if="hasRight" class="w-full min-w-0 min-h-0 flex items-center justify-center image-container">
        <slot name="right" />
      </div>
    </div>
  </div>
</template>
