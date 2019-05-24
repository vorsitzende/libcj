/* CJ.HPP - C++ Specific Function Declarations for LIBCJ
 * Claudia Jughashvili, 2019 */

#ifndef _CJ_H_
#define _CJ_H_

namespace cj {
  extern "C" {

    const char*   itoa    (int, char*, unsigned int = 10);
    unsigned int  strlen  (const char*);
    bool          strcmp  (const char*, const char*);
    void*         memcpy  (void*, const void*, unsigned int);
    void*         memset  (void*, unsigned char, unsigned int);

  };
};

#endif  /* _CJ_H_ */
