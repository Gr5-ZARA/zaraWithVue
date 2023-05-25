<script lang="ts">
import { reactive, provide, inject, InjectionKey } from 'vue';

interface User {
  id: number;
  token: string;
  isAdmin: number;
}

interface UserContext {
  currentUser: User;
  setCurrentUser: (user: User) => void;
  logout: () => void;
}

export const UserContextSymbol: InjectionKey<UserContext> = Symbol();

export const userContext: UserContext = {
  currentUser: reactive<User>({
    id: 0,
    token: '',
    isAdmin: 0
  }),
  setCurrentUser(user: User) {
    this.currentUser = user;
  },
  logout() {
    this.currentUser = {
      id: 0,
      token: '',
      isAdmin: 0
    };
  }
};

export function provideUserContext() {
  provide(UserContextSymbol, userContext);
}

export function useUserContext(): UserContext {
  const context = inject(UserContextSymbol);
  if (!context) {
    throw new Error('No user context provided');
  }
  return context;
}


</script>