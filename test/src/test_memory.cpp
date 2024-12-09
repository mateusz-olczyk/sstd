#include <gtest/gtest.h>

#include "sstd/memory.hpp"

TEST(Memory, EmptyUniquePtr) {
    struct S {
        int member;
    };

    sstd::unique_ptr<S> uptr;

    EXPECT_DEATH({ *uptr; }, "dereference of nullptr");
    EXPECT_DEATH({ (void)uptr->member; }, "dereference of nullptr");
}
