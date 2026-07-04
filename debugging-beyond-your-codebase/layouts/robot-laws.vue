<script setup lang="ts">
import { useSlots } from 'vue'
import TwoColsHeader from './two-cols-header.vue'

const slots = useSlots()
const hasTransition = !!slots['first-summarized']
</script>

<template>
  <TwoColsHeader left-ratio="2" right-ratio="1">
    <template #header>
      <slot name="header" />
    </template>
    
    <template #left>
      <div class="flex flex-col w-full laws-cards">
        <template v-if="hasTransition">
          <div class="relative w-full">
            <Transition name="fade" mode="out-in">
              <LawCard v-if="$clicks < 1" key="reinterpreted-1" title="First Law (Reinterpreted)">
                <slot name="first" />
              </LawCard>
              <LawCard v-else key="summarized-1" class="highlight-card" title="Isolation">
                <slot name="first-summarized" />
              </LawCard>
            </Transition>
          </div>
        </template>
        <template v-else>
          <v-clicks>
            <LawCard title="First Law">
              <slot name="first" />
            </LawCard>
          </v-clicks>
        </template>

        <template v-if="hasTransition">
          <div class="relative w-full">
            <Transition name="fade" mode="out-in">
              <LawCard v-if="$clicks < 2" key="reinterpreted-2" title="Second Law (Reinterpreted)">
                <slot name="second" />
              </LawCard>
              <LawCard v-else key="summarized-2" class="highlight-card" title="Intention">
                <slot name="second-summarized" />
              </LawCard>
            </Transition>
          </div>
        </template>
        <template v-else>
          <v-clicks>
            <LawCard title="Second Law">
              <slot name="second" />
            </LawCard>
          </v-clicks>
        </template>

        <template v-if="hasTransition">
          <div class="relative w-full">
            <Transition name="fade" mode="out-in">
              <LawCard v-if="$clicks < 3" key="reinterpreted-3" title="Third Law (Reinterpreted)">
                <slot name="third" />
              </LawCard>
              <LawCard v-else key="summarized-3" class="highlight-card" title="Integration">
                <slot name="third-summarized" />
              </LawCard>
            </Transition>
          </div>
        </template>
        <template v-else>
          <v-clicks>
            <LawCard title="Third Law">
              <slot name="third" />
            </LawCard>
          </v-clicks>
        </template>
      </div>
    </template>
    
    <template #right>
      <div class="h-full w-full flex items-center justify-center image-container">
        <slot name="right" />
      </div>
    </template>
  </TwoColsHeader>
</template>
