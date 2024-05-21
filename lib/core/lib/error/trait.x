trait ErrorCode { }

impl never : ErrorCode { }

impl void : ErrorCode = never;