<script lang="ts">
import { provide, inject, InjectionKey, reactive } from 'vue';

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

export const useUserContext = (): UserContext => {
  const userContext = inject(UserContextSymbol);
  if (!userContext) {
    throw new Error('No user context provided');
  }
  return userContext;
};

export function ContextProvider(app: any) {
  const currentUser = reactive<User>({
    id: 0,
    token: '',
    isAdmin: 0
  });

  const setCurrentUser = (user: User) => {
    currentUser.id = user.id;
    currentUser.token = user.token;
    currentUser.isAdmin = user.isAdmin;
  };

  const logout = () => {
    currentUser.id = 0;
    currentUser.token = '';
    currentUser.isAdmin = 0;
  };

  const userContext: UserContext = {
    currentUser,
    setCurrentUser,
    logout
  };

  provide(UserContextSymbol, userContext);

  return app;
}
</script>
