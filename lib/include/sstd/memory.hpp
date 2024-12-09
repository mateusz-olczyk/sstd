#pragma once

#include <cassert>
#include <memory>

namespace sstd {
#ifdef SSTD_USE_WRAPPERS

template <typename T, typename Deleter = std::default_delete<T>>
struct unique_ptr : ::std::unique_ptr<T, Deleter> {
    using ::std::unique_ptr<T, Deleter>::unique_ptr;

    typename std::add_lvalue_reference<T>::type operator*() const
            noexcept(noexcept(*std::declval<typename ::std::unique_ptr<T, Deleter>::pointer>())) {
        assert((::std::unique_ptr<T, Deleter>::get() != nullptr) && "dereference of nullptr");
        return ::std::unique_ptr<T, Deleter>::operator*();
    }

    typename ::std::unique_ptr<T, Deleter>::pointer operator->() const noexcept {
        assert((::std::unique_ptr<T, Deleter>::get() != nullptr) && "dereference of nullptr");
        return ::std::unique_ptr<T, Deleter>::operator->();
    }
};

#else

template <typename T, typename Deleter = std::default_delete<T>>
using unique_ptr = ::std::unique_ptr<T, Deleter>;

#endif
}  // namespace sstd
