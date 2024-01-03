import Header from './Header.vue'
import type {Meta, StoryObj} from "@storybook/vue3"

type Story = StoryObj<typeof Header>;

const meta: Meta<typeof Header> = {
  title: 'Todo Header',
  component: Header,
  render: (args) => ({
    components: { Header },
    setup() {
      return args
    },
    template: "<Header :title='title' />",
  }),
  args: {
    title: 'Test Title',
  },
  argTypes: {
  }
}

export const Default: Story = {

}

export default meta