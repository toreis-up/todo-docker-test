import Card from './Card.vue'
import type {Meta, StoryObj} from "@storybook/vue3"

type Story = StoryObj<typeof Card>;

const meta: Meta<typeof Card> = {
  title: 'Todo Card',
  component: Card,
  render: (args) => ({
    components: { Card },
    setup() {
      return args
    },
    template: "<Card :title='title' :isDone='isDone' @change='onChange' />",
  }),
  args: {
    title: 'Test Title',
    isDone: false,

  },
  argTypes: {
    onChange: {action: 'Changed'}
  }
}

export const Default: Story = {

}

export default meta